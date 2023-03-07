package leui.woojoo.web.dto.users.auth;

import leui.woojoo.domain.user_groups.UserGroups;
import leui.woojoo.domain.users.Users;
import leui.woojoo.web.dto.groups.SignupGroupsParam;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@NoArgsConstructor
public class SignupRequest {
    String name;
    String phone_number;
    MultipartFile file;
    String groups;
    String detail1;
    String fcm_token;

    @Builder
    public SignupRequest(String name, String phone_number, MultipartFile file, String groups, String detail1, String fcm_token) {
        this.name = name;
        this.phone_number = phone_number;
        this.file = file;
        this.groups = groups;
        this.detail1 = detail1;
        this.fcm_token = fcm_token;
    }

    public SignupParam toSignupParam(String profileImageName) {
        return SignupParam.builder()
                .name(name)
                .phoneNumber(phone_number)
                .profileImageName(profileImageName)
                .fcmToken(fcm_token)
                .build();
    }

    public SignupGroupsParam toSignupGroupsParam(Long userId) {
        return SignupGroupsParam.builder()
                .userId(userId)
                .groupName(groups)
                .detail1(detail1)
                .build();
    }
}
