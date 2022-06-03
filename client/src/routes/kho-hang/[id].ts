export const get: import("./__types/[id]").RequestHandler = ({ params }) => {
    const waitingOrders: Order[] = [{ id: 1 }, { id: 2 }];
    const waitingContainers: Container[] = [{ id: 1 }, { id: 2 }];
    return {
        body: {
            waitingOrders,
            waitingContainers,
        },
    };
};
