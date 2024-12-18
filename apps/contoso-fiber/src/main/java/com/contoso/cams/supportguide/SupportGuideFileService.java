package com.contoso.cams.supportguide;

import java.io.IOException;
import java.util.List;

public interface SupportGuideFileService {
    List<SupportGuideDto> getSupportGuides();

    void uploadGuide(UploadSupportGuideRequest uploadFormData) throws IOException;
}
