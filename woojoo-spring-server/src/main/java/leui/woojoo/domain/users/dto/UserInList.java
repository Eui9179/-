package leui.woojoo.domain.users.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.users.dto.repository.UserFriendsWithUsersDto;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserInList implements Comparable<UserInList> {
    private Long id;
    private String name;
    private String profileImageName;
    private List<String> intersection;

    public UserInList(UserFriendsWithUsersDto userFriendsWithUsersDto, List<String> intersection) {
        this.id = userFriendsWithUsersDto.getId();
        this.name = userFriendsWithUsersDto.getName();
        this.profileImageName = userFriendsWithUsersDto.getProfileImageName();
        this.intersection = intersection;
    }

    @Override
    public int compareTo(UserInList f) {
        return this.name.compareTo(f.name);
    }
}
