package leui.woojoo.web.dto.groups;

import leui.woojoo.web.dto.users.profile.user_profile_request.UserFriend;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GroupsByNameResponse {
    List<UserFriend> people;
    List<UserFriend> friends;
}
