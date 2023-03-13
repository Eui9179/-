package leui.woojoo.web.dto.users.profile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.web.dto.users.UsersDto;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class MeRequest {
    private Long id;
    private String name;
    private String phoneNumber;
    private String profileImageName;

    public MeRequest(UsersDto user) {
        this.id = user.getId();
        this.name = user.getName();
        this.phoneNumber = user.getPhoneNumber();
        this.profileImageName = user.getProfileImageName();
    }
}
