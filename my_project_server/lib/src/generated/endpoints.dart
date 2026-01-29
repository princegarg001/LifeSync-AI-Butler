/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/chat_endpoint.dart' as _i4;
import '../endpoints/dashboard_endpoint.dart' as _i5;
import '../endpoints/insight_endpoint.dart' as _i6;
import '../endpoints/task_endpoint.dart' as _i7;
import '../endpoints/user_endpoint.dart' as _i8;
import '../greetings/greeting_endpoint.dart' as _i9;
import 'package:my_project_server/src/generated/insight.dart' as _i10;
import 'package:my_project_server/src/generated/task.dart' as _i11;
import 'package:my_project_server/src/generated/user.dart' as _i12;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i13;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i14;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'chat': _i4.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
      'dashboard': _i5.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'insight': _i6.InsightEndpoint()
        ..initialize(
          server,
          'insight',
          null,
        ),
      'task': _i7.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
      'user': _i8.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'greeting': _i9.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i4.ChatEndpoint).sendMessage(
                session,
                params['userId'],
                params['message'],
              ),
        ),
        'getChatHistory': _i1.MethodConnector(
          name: 'getChatHistory',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i4.ChatEndpoint).getChatHistory(
                session,
                params['userId'],
              ),
        ),
        'clearChatHistory': _i1.MethodConnector(
          name: 'clearChatHistory',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['chat'] as _i4.ChatEndpoint).clearChatHistory(
                    session,
                    params['userId'],
                  ),
        ),
        'getQuickSuggestions': _i1.MethodConnector(
          name: 'getQuickSuggestions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i4.ChatEndpoint)
                  .getQuickSuggestions(session),
        ),
      },
    );
    connectors['dashboard'] = _i1.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getDashboardData': _i1.MethodConnector(
          name: 'getDashboardData',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userName': _i1.ParameterDescription(
              name: 'userName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['dashboard'] as _i5.DashboardEndpoint)
                  .getDashboardData(
                    session,
                    params['userId'],
                    params['userName'],
                  ),
        ),
      },
    );
    connectors['insight'] = _i1.EndpointConnector(
      name: 'insight',
      endpoint: endpoints['insight']!,
      methodConnectors: {
        'getInsights': _i1.MethodConnector(
          name: 'getInsights',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['insight'] as _i6.InsightEndpoint).getInsights(
                    session,
                    params['userId'],
                  ),
        ),
        'createInsight': _i1.MethodConnector(
          name: 'createInsight',
          params: {
            'insight': _i1.ParameterDescription(
              name: 'insight',
              type: _i1.getType<_i10.Insight>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['insight'] as _i6.InsightEndpoint).createInsight(
                    session,
                    params['insight'],
                  ),
        ),
        'dismissInsight': _i1.MethodConnector(
          name: 'dismissInsight',
          params: {
            'insightId': _i1.ParameterDescription(
              name: 'insightId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['insight'] as _i6.InsightEndpoint).dismissInsight(
                    session,
                    params['insightId'],
                  ),
        ),
        'generateInsights': _i1.MethodConnector(
          name: 'generateInsights',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['insight'] as _i6.InsightEndpoint)
                  .generateInsights(
                    session,
                    params['userId'],
                  ),
        ),
        'getActiveInsightCount': _i1.MethodConnector(
          name: 'getActiveInsightCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['insight'] as _i6.InsightEndpoint)
                  .getActiveInsightCount(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['task'] = _i1.EndpointConnector(
      name: 'task',
      endpoint: endpoints['task']!,
      methodConnectors: {
        'createTask': _i1.MethodConnector(
          name: 'createTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i11.Task>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).createTask(
                session,
                params['task'],
              ),
        ),
        'getTasks': _i1.MethodConnector(
          name: 'getTasks',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).getTasks(
                session,
                params['userId'],
              ),
        ),
        'getTasksByStatus': _i1.MethodConnector(
          name: 'getTasksByStatus',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['task'] as _i7.TaskEndpoint).getTasksByStatus(
                    session,
                    params['userId'],
                    params['status'],
                  ),
        ),
        'getTodaysTasks': _i1.MethodConnector(
          name: 'getTodaysTasks',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).getTodaysTasks(
                session,
                params['userId'],
              ),
        ),
        'getOverdueTasks': _i1.MethodConnector(
          name: 'getOverdueTasks',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['task'] as _i7.TaskEndpoint).getOverdueTasks(
                    session,
                    params['userId'],
                  ),
        ),
        'getUpcomingTasks': _i1.MethodConnector(
          name: 'getUpcomingTasks',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['task'] as _i7.TaskEndpoint).getUpcomingTasks(
                    session,
                    params['userId'],
                  ),
        ),
        'updateTask': _i1.MethodConnector(
          name: 'updateTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i11.Task>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).updateTask(
                session,
                params['task'],
              ),
        ),
        'completeTask': _i1.MethodConnector(
          name: 'completeTask',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).completeTask(
                session,
                params['taskId'],
              ),
        ),
        'deleteTask': _i1.MethodConnector(
          name: 'deleteTask',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).deleteTask(
                session,
                params['taskId'],
              ),
        ),
        'getTaskCount': _i1.MethodConnector(
          name: 'getTaskCount',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i7.TaskEndpoint).getTaskCount(
                session,
                params['userId'],
                params['status'],
              ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'createOrUpdateUser': _i1.MethodConnector(
          name: 'createOrUpdateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i12.User>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i8.UserEndpoint).createOrUpdateUser(
                    session,
                    params['user'],
                  ),
        ),
        'getUserByEmail': _i1.MethodConnector(
          name: 'getUserByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i8.UserEndpoint).getUserByEmail(
                session,
                params['email'],
              ),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i8.UserEndpoint).getUserById(
                session,
                params['userId'],
              ),
        ),
        'updateLastActive': _i1.MethodConnector(
          name: 'updateLastActive',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i8.UserEndpoint).updateLastActive(
                    session,
                    params['userId'],
                  ),
        ),
        'updatePreferences': _i1.MethodConnector(
          name: 'updatePreferences',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'timezone': _i1.ParameterDescription(
              name: 'timezone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'notificationsEnabled': _i1.ParameterDescription(
              name: 'notificationsEnabled',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['user'] as _i8.UserEndpoint).updatePreferences(
                    session,
                    params['userId'],
                    timezone: params['timezone'],
                    notificationsEnabled: params['notificationsEnabled'],
                  ),
        ),
        'updateAvatar': _i1.MethodConnector(
          name: 'updateAvatar',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'avatarUrl': _i1.ParameterDescription(
              name: 'avatarUrl',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['user'] as _i8.UserEndpoint).updateAvatar(
                session,
                params['userId'],
                params['avatarUrl'],
              ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i9.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i13.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i14.Endpoints()
      ..initializeEndpoints(server);
  }
}
