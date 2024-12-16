package com.contoso.cams.supportguide;

import com.contoso.cams.protobuf.guides.v1.GuideUploadUrlRequest;
import com.contoso.cams.protobuf.guides.v1.GuideUploadUrlResponse;
import com.contoso.cams.protobuf.guides.v1.SupportGuideServiceGrpc;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class SupportguideApplication {

	public static void main(String[] args) {
		SpringApplication.run(SupportguideApplication.class, args);
	}
}

@GrpcService
class SupportGuideService extends SupportGuideServiceGrpc.SupportGuideServiceImplBase {
    @Override
    public void getGuideUploadUrl(GuideUploadUrlRequest request, StreamObserver<GuideUploadUrlResponse> responseObserver) {
        String fileName = request.getFileName();
        String uploadUrl = "https://upload.example.com/" + fileName;
        GuideUploadUrlResponse response = GuideUploadUrlResponse.newBuilder()
                .setUploadUrl(uploadUrl)
                .setFileName(fileName)
                .build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }
}

@RestController
class SupportGuideController {
    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}

