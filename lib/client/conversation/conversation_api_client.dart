import 'package:dio/dio.dart';
import 'package:inboxbutton_flutter/client/inboxbutton_header_option.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../interceptors/request_interceptor.dart';

part 'conversation_api_client.g.dart';

/// A Calculator.
@RestApi()
abstract class ConversationApiClient {
  factory ConversationApiClient(Dio dio, {String baseUrl}) =
      _ConversationApiClient;

  static const int CONNECTION_TIME = 10;
  static const basePath = 'https://dev-api.inboxbutton.com/v1';

  static Dio getDio(InboxButtonHeaderOption option) {
    var dio = Dio(BaseOptions(
        baseUrl: option.basePath,
        connectTimeout: CONNECTION_TIME * 1000,
        receiveTimeout: CONNECTION_TIME * 1000));

    dio.interceptors.addAll([
      RequestInterceptor(option),
      if (option.isDebug)
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true),
    ]);
    return dio;
  }

  // @POST("/conversations")
  // Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest request);

  // // Method
  // @GET("/api/bootstrap")
  // Future<HttpResponse<BootstrapResponse>> getBootstrap();
  //
  // @POST("/api/auth/login")
  // Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest request);
  //
  // @POST("/api/auth/register")
  // Future<HttpResponse<RegisterResponse>> register(
  //     @Body() RegisterRequest request);
  //
  // @GET("/api/me/profile")
  // Future<HttpResponse<MeResponse>> me();
  //
  // @POST("/api/auth/refresh")
  // Future<HttpResponse<RefreshResponse>> refresh(@Body() RefreshRequest request);
  //
  // @POST("/api/auth/logout")
  // Future<HttpResponse<LogoutResponse>> logout();
  //
  // @POST("/api/auth/change-password")
  // Future<HttpResponse<ChangePasswordResponse>> changePassword(
  //     @Body() ChangePasswordRequest request);
  //
  // @POST("/api/auth/otp")
  // Future<HttpResponse<OtpResponse>> otp(
  //     @Body() OtpRequest request, @Query("isResend") bool isResend);
  //
  // @POST("/api/auth/recovery")
  // Future<HttpResponse<RecoveryResponse>> recovery(
  //     @Body() RecoveryRequest request);
  //
  // @POST("/api/auth/reset-password")
  // Future<HttpResponse<ResetPasswordResponse>> resetPassword(
  //     @Body() ResetPasswordRequest request);
  //
  // @GET("/api/auth/wallet")
  // Future<HttpResponse<WalletResponse>> wallet();
  //
  // @POST("/api/auth/account-deletion")
  // Future<HttpResponse<ResultResponse>> deleteAccount();
  //
  // @POST("/api/dna/user-profiles")
  // Future<HttpResponse<CreateDnaProfileResponse>> createDnaProfile(
  //     @Body() CreateDnaProfileRequest request);
  //
  // @GET("/api/dna/user-profiles")
  // Future<HttpResponse<List<GetDnaProfileListResponse>>> getDnaProfileList();
  //
  // @GET("/api/dna/user-profiles/{id}?join=tracking")
  // Future<HttpResponse<GetDnaProfileResponse>> getDnaProfile(
  //     @Path("id") String id);
  //
  // @GET("/api/advisors")
  // Future<HttpResponse<List<AdvisorResponse>>> getAdvisors(
  //     @Query("filter") String? type,
  //     @Query("filter") String? category,
  //     @Query("limit") int limit,
  //     @Query("page") int page);
  //
  // @GET("/api/advisors/{id}")
  // Future<HttpResponse<AdvisorResponse>> getAdvisorDetail(@Path("id") String id);
  //
  // @GET("/api/appointments/advisors/{consultantId}/available-dates")
  // Future<HttpResponse<List<AppointmentDateResponse>>>
  //     getAppointmentAvailableDate(@Path("consultantId") String consultantId);
  //
  // @GET("/api/appointments/advisors/{consultantId}/available-dates/{date}/slots")
  // Future<HttpResponse<List<AppointmentTimeResponse>>>
  //     getAppointmentAvailableTime(
  //         @Path("consultantId") String consultantId, @Path("date") String date);
  //
  // @POST("/api/appointments")
  // Future<HttpResponse<AppointmentCreateResponse>> createAppointment(
  //     @Body() AppointmentCreateRequest request);
  //
  // @POST("/api/promotions/apply")
  // Future<HttpResponse<AppointmentPromoResponse>> getPromoCode(
  //     @Body() AppointmentPromoRequest request);
  //
  // @PATCH("/api/appointments/{appointmentId}")
  // Future<HttpResponse<AppointmentCreateResponse>> cancelAppointment(
  //     @Path("appointmentId") String appointmentId,
  //     @Body() AppointmentCancelRequest request);
  //
  // @POST("/api/appointment-orders")
  // Future<HttpResponse<AppointmentCreateOrderResponse>> createAppointmentOrder(
  //     @Body() AppointmentCreateOrderRequest request);
  //
  // @POST("/api/appointments/{appointmentId}/reschedule")
  // Future<HttpResponse<AppointmentCreateResponse>> rescheduleAppointment(
  //     @Path("appointmentId") String appointmentId,
  //     @Body() AppointmentRescheduleRequest request);
  //
  // @GET("/api/dna/reports/{id}")
  // Future<HttpResponse<List<DnaReportResponse>>> getDnaReport(
  //     @Path("id") String id);
  //
  // @GET("/api/dna/reports/{id}/categories/{categoryId}")
  // Future<HttpResponse<List<DnaDiseaseResponse>>> getDnaDisease(
  //     @Path("id") String id, @Path("categoryId") String categoryId);
  //
  // @GET("/api/dna/diseases/{id}")
  // Future<HttpResponse<DnaDiseaseDetail>> getDnaDiseaseDetail(
  //     @Path("id") String id);
  //
  // @GET("/api/appointments/upload")
  // Future<HttpResponse<AttachmentResponse>> getSignedUrl(
  //     @Query("fileName") String fileName, @Query("mimeType") String mimeType);
  //
  // @GET("/api/appointments/upcoming")
  // Future<HttpResponse<List<AppointmentBookingResponse>>> getAppointmentBookings(
  //     @Query("join") String advisor,
  //     @Query("limit") int limit,
  //     @Query("page") int page);
  //
  // @GET("/api/appointments/cancelled")
  // Future<HttpResponse<List<AppointmentBookingResponse>>> getCancelledBookings(
  //     @Query("join") String advisor,
  //     @Query("limit") int limit,
  //     @Query("page") int page);
  //
  // @GET("/api/appointments/histories")
  // Future<HttpResponse<List<AppointmentBookingResponse>>>
  //     getAppointmentBookingsHistory(@Query("join") String advisor,
  //         @Query("limit") int limit, @Query("page") int page);
  //
  // @GET("/api/appointments/{id}")
  // Future<HttpResponse<AppointmentBookingResponse>> getAppointmentWithId(
  //     @Path("id") String appointmentId, @Query("join") String advisor);
  //
  // @GET("/api/user-notifications?limit={take}}&page={page}")
  // Future<HttpResponse<List<UserNotification>>> getNotifications(
  //     @Query("page") int page, @Query("take") int take);
  //
  // @GET("/api/user-notifications/{id}")
  // Future<HttpResponse<UserNotification>> getNotificationDetail(
  //     @Path("id") String id);
  //
  // @DELETE("/api/user-notifications/{id}")
  // Future<HttpResponse> deleteNotification(@Path("id") String id);
  //
  // @POST("/api/user-notifications/{id}/read")
  // Future<HttpResponse> readNotification(@Path("id") String id);
  //
  // @GET("/api/appointments/advisor-packages")
  // Future<HttpResponse<List<AppointmentIAPResponse>>> getInAppPurchasePackages();
}
