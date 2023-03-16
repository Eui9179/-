package leui.woojoo.web.dto.users.profile.user_profile_request;

import leui.woojoo.domain.entity.user_groups.UserGroups;
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
