package leui.woojoo.web.dto.groups;

import leui.woojoo.domain.entity.user_groups.UserGroups;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignupGroupsParam {
    private Long userId;
    private String groupName;
    private String detail1;
}
