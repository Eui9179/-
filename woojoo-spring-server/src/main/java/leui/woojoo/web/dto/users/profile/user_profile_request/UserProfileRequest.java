package leui.woojoo.web.dto.users.profile.user_profile_request;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserProfileRequest {
    private UserProfile userProfile;
    private boolean isFriend;
    private List<UserGroup> userGroups;
    private List<UserGame> userGames;
    private ArrayList<UserFriend> alreadyFriends;
    private ArrayList<UserFriend> userFriends;
}
