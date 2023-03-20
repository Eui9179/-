package leui.woojoo.domain.friends.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.friends.entity.Friends;
import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class FriendId {
    private Long userId;
    private Long friendId;

    public FriendId(Friends friends) {
        this.userId = friends.getUsers().getId();
        this.friendId = friends.getFriendsId();
    }
}
