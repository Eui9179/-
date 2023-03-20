package leui.woojoo.domain.users.dto.web.profile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.users.dto.UserDetail;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class MeResponse {
    private Long id;
    private String name;
    private String phoneNumber;
    private String profileImageName;

    public MeResponse(UserDetail user) {
        this.id = user.getId();
        this.name = user.getName();
        this.phoneNumber = user.getPhoneNumber();
        this.profileImageName = user.getProfileImageName();
    }
}
