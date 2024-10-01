import 'package:faker/faker.dart';
import 'package:hui/models/post_model.dart';
import 'package:hui/models/user_model.dart';

void main(List<String> arguments) {
  var user = User(
    id: faker.guid.guid(),
    name: faker.person.name(),
    email: faker.internet.email(),
    password: faker.internet.password(),
  );

  List<Post> posts = [
    Post(
        title: faker.person.name(),
        body: faker.lorem.sentence() * 5,
        user: user),
    Post(
        title: faker.person.name(),
        body: faker.lorem.sentence() * 5,
        user: user),
    Post(
        title: faker.person.name(),
        body: faker.lorem.sentence() * 5,
        user: user),
  ];

  for (Post post in posts) {
    print(post.toJson());
    print('--------------------------------');
  }
}
