package ma.chana9.modules.annonce.dto;

import lombok.*;
import ma.chana9.shared.enums.MediaFormat;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceMediaResponse {

    private UUID id;
    private String url;
    private Integer order;
    private Boolean isCover;
    private MediaFormat format;
}
