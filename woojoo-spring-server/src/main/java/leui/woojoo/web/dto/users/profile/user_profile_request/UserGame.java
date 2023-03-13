package leui.woojoo.web.dto.users.profile.user_profile_request;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserGame {
    private String game;
    private String nickname;
}
