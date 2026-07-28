declare module "midtrans-client" {
  export class Snap {
    constructor(options: {
      isProduction?: boolean;
      serverKey: string;
      clientKey: string;
    });

    createTransaction(parameter: any): Promise<{
      token: string;
      redirect_url: string;
    }>;

    createTransactionToken(parameter: any): Promise<string>;
    createTransactionRedirectUrl(parameter: any): Promise<string>;
  }

  export class CoreApi {
    constructor(options: {
      isProduction?: boolean;
      serverKey: string;
      clientKey: string;
    });

    transaction: {
      notification(notificationObj: any): Promise<any>;
      status(transactionIdOrOrderId: string): Promise<any>;
      approve(transactionIdOrOrderId: string): Promise<any>;
      deny(transactionIdOrOrderId: string): Promise<any>;
      cancel(transactionIdOrOrderId: string): Promise<any>;
      expire(transactionIdOrOrderId: string): Promise<any>;
      refund(transactionIdOrOrderId: string, parameter?: any): Promise<any>;
    };
  }
}
