package leui.woojoo.config;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class VerifyResult {
    private boolean success;
    private Long userId;
}
