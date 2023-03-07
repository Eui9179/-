package leui.woojoo.web.dto.files;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
public class ImageUploader {
    public static String upload(MultipartFile file, String kind) throws IOException {
        if (file.isEmpty()) {
            return "default.png";
        }

        long nowDate = System.currentTimeMillis();
        Timestamp timeStamp = new Timestamp(nowDate);

        File newFileName = new File(timeStamp.getTime() + "_" + kind);
        //TODO 저장 로직 추가
        file.transferTo(newFileName);

        return newFileName.getName();
    }
}
