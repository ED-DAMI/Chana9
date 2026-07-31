package ma.chana9.modules.payment.dto;

public record PaymentWebhookRequest(
        String transactionId,
        String status,
        String signature
) {}
