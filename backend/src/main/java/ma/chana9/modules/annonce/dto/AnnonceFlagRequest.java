package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.NotNull;
import lombok.*;
import ma.chana9.shared.enums.FlagReason;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceFlagRequest {

    @NotNull
    private FlagReason reason;

    private String comment;
}
