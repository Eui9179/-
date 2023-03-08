package leui.woojoo.utils.file;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@Slf4j
@Component
public class FileUtils {
    @Value("${file.path}")
    private String imagePath;

    public String upload(MultipartFile file, String kind) throws IOException {
        if (file.isEmpty()) {
            return "default.png";
        }

        long nowDate = System.currentTimeMillis();
        long timeStamp = new Timestamp(nowDate).getTime();
        String ext = file.getOriginalFilename().split("\\.")[1];

        File newFileName = new File( imagePath + "/" + kind + "/"
                + timeStamp + "_" + kind + "." + ext);

        log.info(newFileName.getName());
        file.transferTo(newFileName);

        return newFileName.getName();
    }
}
