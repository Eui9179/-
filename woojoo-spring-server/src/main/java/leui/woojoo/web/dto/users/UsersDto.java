package leui.woojoo.web.dto.users;

import leui.woojoo.domain.entity.users.Users;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsersDto {
    private Long id;
    private String name;
    private String phoneNumber;
    private String profileImageName;
    private String fcmToken;

    public UsersDto(Users users) {
        this.id = users.getId();
        this.name = users.getName();
        this.phoneNumber = users.getPhoneNumber();
        this.profileImageName = users.getProfileImageName();
        this.fcmToken = users.getFcmToken();
    }


}
