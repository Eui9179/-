package leui.woojoo.web.dto.friends;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.entity.friends.Friends;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class FriendDto {
    private Long userId;
    private Long friendId;

    public FriendDto(Friends friends) {
        this.userId = friends.getUsers().getId();
        this.friendId = friends.getFriendsId();
    }
}
