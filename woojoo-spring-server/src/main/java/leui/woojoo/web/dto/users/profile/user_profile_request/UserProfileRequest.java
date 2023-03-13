package leui.woojoo.web.dto.users.profile.user_profile_request;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.util.ArrayList;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserProfileRequest {
    private UserProfile userProfile;
    private boolean isFriend;
    private ArrayList<UserGroup> userGroups;
    private ArrayList<UserGame> userGames;
    private ArrayList<Friends> alreadyFriends;
    private ArrayList<Friends> userFriends;
}
