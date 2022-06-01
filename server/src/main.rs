use axum::{
    extract::{ws::WebSocket, WebSocketUpgrade},
    response::IntoResponse,
    routing::get,
    Router,
};

use std::net::SocketAddr;

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt::init();

    // build our application with a route
    let app = Router::new()
        // `GET /` goes to `root`
        .route("/", get(root))
        .route("/list", get(list_handler));
    // `POST /users` goes to `create_user`
    // .route("/users", post(create_user));

    // run our app with hyper
    // `axum::Server` is a re-export of `hyper::Server`
    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    tracing::info!("listening on {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn list_handler(ws: WebSocketUpgrade) -> impl IntoResponse {
    ws.on_upgrade(|mut socket: WebSocket| async move {
        tracing::info!("New socket");

        while let Some(msg) = socket.recv().await {
            let msg = if let Ok(msg) = msg {
                msg
            } else {
                tracing::info!("client disconnected");
                return;
            };

            tracing::info!("{:?}", msg);

            if socket.send(msg).await.is_err() {
                return;
            }
        }
    })
}

// basic handler that responds with a static string
async fn root() -> &'static str {
    "Hello, World!"
}
