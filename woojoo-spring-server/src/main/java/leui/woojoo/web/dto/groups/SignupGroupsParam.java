package leui.woojoo.web.dto.groups;

import leui.woojoo.domain.entity.user_groups.UserGroups;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SignupGroupsParam {
    private Long userId;
    private String groupName;
    private String detail1;

    @Builder
    public SignupGroupsParam(Long userId, String groupName, String detail1) {
        this.userId = userId;
        this.groupName = groupName;
        this.detail1 = detail1;
    }
}
