package leui.woojoo.domain.users.dto.web.profile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.users.dto.UserSimple;
import leui.woojoo.domain.users.dto.web.profile.user_profile_request.UserFriend;
import leui.woojoo.domain.users.dto.web.profile.user_profile_request.UserGame;
import leui.woojoo.web.dto.groups.UserGroup;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserProfileResponse {
    private UserSimple userSimple;
    private boolean isFriend;
    private List<UserGroup> userGroups;
    private List<UserGame> userGames;
    private ArrayList<UserFriend> alreadyFriends;
    private ArrayList<UserFriend> userFriends;
}
