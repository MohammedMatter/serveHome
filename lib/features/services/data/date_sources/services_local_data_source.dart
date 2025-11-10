import 'package:serve_home/features/services/data/models/service_model.dart';

class ServicesLocalDataSource {
  List<ServiceModel> services = [
    ServiceModel(
      id: '0',
      name: 'Electrical',
      description:
          'Our electrical services cover all home and office needs, including installation, repair, and maintenance of wiring, switches, sockets, and lighting fixtures. We ensure safety and efficiency in every job, providing professional solutions for both small and large electrical tasks.',
      price: '10',
      categoryImageUrl: 'assets/images/services/electrical_service.png',
      detailImageUrl: 'assets/images/service_details/electrical.png'
    ),

    ServiceModel(
      id: '1',
      name: 'Plumbing',
      description:
          'Our plumbing services cover all aspects of water systems, including leak repairs, faucet and pipe installations, unclogging drains, and full maintenance of plumbing fixtures. Our certified plumbers ensure fast and reliable service to prevent water damage and ensure smooth operation.',
      price: '30',
      categoryImageUrl: 'assets/images/services/plumbing_service.png',
       detailImageUrl: 'assets/images/service_details/plumbing.png'
    ),
    ServiceModel(
      id: '2',
      name: 'Maintenance',
      description:
          'We provide general maintenance services for homes and offices, including appliance repairs, fixture replacements, and routine system checks. Our team ensures that all devices and infrastructure are functioning properly, reducing downtime and extending the lifespan of your equipment.',
      price: '40',
      categoryImageUrl: 'assets/images/services/maintenance.png',
       detailImageUrl: 'assets/images/service_details/maintenance.png'
    ),
    ServiceModel(
      id: '3',
      name: 'Decorating',
      description:
          'Our decorating services include interior design, painting, furniture arrangement, and aesthetic improvements for homes and offices. We work to enhance the look and feel of your space, combining style and functionality to create an environment you will love.',
      price: '50',
      categoryImageUrl: 'assets/images/services/decorating.png',
       detailImageUrl: 'assets/images/service_details/decorating.png'
    ),
    ServiceModel(
      id: '4',
      name: 'Cleaning',
      description:
          'We offer comprehensive cleaning services for homes and offices, including floor scrubbing, window washing, surface sanitization, and deep cleaning of kitchens and bathrooms. Our team ensures a spotless and hygienic environment, using eco-friendly products and professional techniques.',
      price: '20',
      categoryImageUrl: 'assets/images/services/cleaning_service.png',
       detailImageUrl: 'assets/images/service_details/cleaning.png'
    ),
  ];

  List<ServiceModel> getServices() {
    return services;
  }
}
