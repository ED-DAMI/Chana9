package ma.chana9.modules.auth.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class OtpRequest {

    @NotBlank
    private String phone;

    @NotBlank
    private String otp;
}
