package leui.woojoo.domain.users.dto.web;

import leui.woojoo.domain.users.dto.web.profile.user_profile_request.UserFriend;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UsersInGroupResponse {
    List<UserFriend> people;
    List<UserFriend> friends;
}
