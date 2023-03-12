package leui.woojoo.web.dto.users.fcm;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FcmRequest {
    @JsonProperty("fcm_token")
    private String fcmToken;
}
