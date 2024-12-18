package com.contoso.cams.supportguide;

import com.contoso.cams.model.SupportGuideRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;

@Configuration
public class SupportGuideFileServiceConfig {

    @Bean
    @ConditionalOnProperty(prefix="contoso.support-guide.file", name="service", havingValue="grpc")
    SupportGuideFileService supportGuideGrpc() {
        return new SupportGuideFileServiceGrpc();
    }

    @Bean
    @ConditionalOnProperty(prefix="contoso.support-guide.file", name="service", havingValue="legacy")
    SupportGuideFileService supportGuideLegacy(SupportGuideRepository guideRepository, ResourceLoader resourceLoader, @Value("${spring.cloud.azure.storage.blob.container-name}") String blobContainerName) {
        return new SupportGuideFileServiceLegacy(guideRepository, resourceLoader, blobContainerName);
    }
}
