package leui.woojoo.web.dto.users.profile.user_profile_request;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.util.ArrayList;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class Friends {
    private Long id;
    private String name;
    private String profileImageName;
    private ArrayList<String> intersection;
}
