

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/features/services/data/models/service_model.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class DeleteServiceWidget extends StatelessWidget {
  ServiceModel serviceModel ; 
   DeleteServiceWidget({
    required this.serviceModel , 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(
      builder: (context, provService, child) =>  Expanded(
        child: OutlinedButton.icon(
          icon: Icon(
            Icons
                .delete_forever_outlined,
            color:
                Colors
                    .red,
          ),
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(
              Colors.red
                  .withOpacity(
                    0.3,
                  ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                      8,
                    ),
              ),
            ),
          ),
          onPressed: () async {
            showDialog(
              context:
                  context,
              builder:
                  (
                    context,
                  ) => AlertDialog(
                    actions: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(
                            Colors.black,
                          ),
                          overlayColor: WidgetStatePropertyAll(
                            Colors.red.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await provService.deleteService(
                            serviceModel:
                              serviceModel ,
                          );
                          GoRouter.of(
                            context,
                          ).pop();
                        },
                        child: Text(
                          'Delete',
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(
                            Colors.black,
                          ),
                        ),
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).pop();
                        },
                        child: Text(
                          'Cancel',
                        ),
                      ),
                    ],
                    title: Text(
                      'Confirm Deletion',
                    ),
                    content: Text(
                      'Deleting this service will remove it permanently from the system and cannot be recovered',
                    ),
                  ),
            );
          },
          label: Text(
            'Delete',
            style: TextStyle(
              color:
                  Colors
                      .red,
            ),
          ),
        ),
      ),
    );
  }
}
