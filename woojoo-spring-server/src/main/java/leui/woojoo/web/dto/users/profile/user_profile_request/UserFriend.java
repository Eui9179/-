package leui.woojoo.web.dto.users.profile.user_profile_request;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.entity.users.dto.UserFriendsWithUsersDto;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserFriend implements Comparable<UserFriend> {
    private Long id;
    private String name;
    private String profileImageName;
    private List<String> intersection;

    public UserFriend(UserFriendsWithUsersDto userFriendsWithUsersDto, List<String> intersection) {
        this.id = userFriendsWithUsersDto.getId();
        this.name = userFriendsWithUsersDto.getName();
        this.profileImageName = userFriendsWithUsersDto.getProfileImageName();
        this.intersection = intersection;
    }

    @Override
    public int compareTo(UserFriend f) {
        return this.name.compareTo(f.name);
    }
}
