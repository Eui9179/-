package leui.woojoo.domain.user_groups.dto;

import leui.woojoo.domain.user_groups.entity.UserGroups;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserGroup {
    private String name;
    private String detail1;

    public UserGroup(UserGroups userGroups) {
        this.name = userGroups.getGroupName();
        this.detail1 = userGroups.getDetail1();
    }
}
