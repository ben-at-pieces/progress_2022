import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:gsheets/pie/models/package_model.dart';

class ScraperService {
  static List<PackageModel>? run(String html) {
    try {
      final soup = BeautifulSoup(html);
      final items = soup.findAll('div', class_: 'packages-item');
      List<PackageModel> packages = [];
      for (var item in items) {
        final title = item.find('h3', class_: 'packages-title')?.text ?? '';
        final likes = item.find('div', class_: 'packages-score-value')?.text ?? '';
        final description = item.find('p', class_: 'packages-description')?.text ?? '';
        final version = item.findAll('span', class_: 'packages-metadata-block').first.text;
        final tags = item.findAll('a', class_: 'tag-badge-sub').map((e) => e.text).toList();

        PackageModel model = PackageModel(
          title: title,
          likes: likes,
          description: description,
          version: version,
          tags: tags,
        );
        packages.add(model);
        return packages;
      }
    } catch (e) {
      print(e);
    }
  }
}
