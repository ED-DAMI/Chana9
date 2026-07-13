package ma.chana9.modules.auth.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;


public record OtpRequest (

    @NotBlank
    String phone,
    @NotBlank
     String otp
){}
