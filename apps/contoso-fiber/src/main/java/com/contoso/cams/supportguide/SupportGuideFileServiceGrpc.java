package com.contoso.cams.supportguide;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.contoso.cams.protobuf.guides.v1.GuideUploadUrlRequest;
import com.contoso.cams.protobuf.guides.v1.GuideUploadUrlResponse;
import com.contoso.cams.protobuf.guides.v1.SupportGuideServiceGrpc;

import net.devh.boot.grpc.client.inject.GrpcClient;

import java.io.IOException;
import java.util.List;

public class SupportGuideFileServiceGrpc implements SupportGuideFileService {
    private static final Logger log = LoggerFactory.getLogger(SupportGuideFileServiceGrpc.class);

    // GRPC client to communicate with the support guide service
    @GrpcClient("contoso-support-guide-file-service")
    private SupportGuideServiceGrpc.SupportGuideServiceBlockingStub supportGuideServiceBlockingStub;

    @Override
    public List<SupportGuideDto> getSupportGuides() {
        log.info("Retrieving support guides from gRPC service");
        return null;
    }

    @Override
    public void uploadGuide(UploadSupportGuideRequest uploadFormData) throws IOException {
        log.info("Uploading guide from gRPC service");
        final String fileName = uploadFormData.file.getOriginalFilename();

        GuideUploadUrlResponse response = supportGuideServiceBlockingStub.getGuideUploadUrl(GuideUploadUrlRequest.newBuilder()
                .setFileName(fileName)
                .build());

        log.info("Received upload URL: {}", response.getUploadUrl());
    }
}
