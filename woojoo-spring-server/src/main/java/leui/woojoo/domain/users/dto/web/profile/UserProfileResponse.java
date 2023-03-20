package leui.woojoo.domain.users.dto.web.profile;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.users.dto.UserSimple;
import leui.woojoo.domain.users.dto.UserInList;
import leui.woojoo.domain.user_games.dto.UserGame;
import leui.woojoo.domain.user_groups.dto.UserGroup;
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
    private ArrayList<UserInList> alreadyFriends;
    private ArrayList<UserInList> userInLists;
}
