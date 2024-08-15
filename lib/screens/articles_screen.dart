import 'package:flutter/material.dart';

// 1. Yazı model sınıfını oluştur
class Article {
  final String title;
  final String subtitle;
  final String content;

  Article(this.title, this.subtitle, this.content);
}

class ArticlesScreen extends StatelessWidget {
  // 2. Yazıların bir listesini oluştur
  final List<Article> articles = [
    Article(
      'Amaç / Niyet',
      'Amaçlarımızın ardındaki gerçekleri keşfedin.',
      '''Yaptıklarımızın ve isteklerimizin arkasındaki amaç, anlamamız gereken en önemli konudur. Peki amaç nedir? Amaç, eylemlerimizin nedenini, isteklerimizin sebebini ifade eder. Amaç arkasında aslında her şey yatar. Bir şeyi gerçekleştireceğimizde, isteğimizin gerçekleştiğini varsayarız. Aslında isteğin arkasındaki amaç gerçekleşir. Evrenin her şeyi amaç ve niyet üzerine kuruludur. Bunu nasıl anlayabiliriz?

İşte bazı örnekler: Eğer yalnızlık hissetmemek için evlenmek istiyorsak, evlilikte de yalnız oluruz. Eğer başka bir yere taşınıyorsak, soyulma veya saldırı korkusuyla, yeni yerimizde de bu tür sorunlarla karşılaşacağız. Eğer hastalanmaktan korktuğumuz için spor yapıyorsak, spor yapmamıza rağmen hasta oluruz. Eğer kötü bir ciltten korkarak birçok bakım ürünü kullanıyorsak, o zaman da kötü bir cildimiz olacak veya hatta bir cilt döküntü yaşayabiliriz. Bu karşılaştırmada, özellikle kadın ve erkeklerin davranışlarını gözlemleyebiliriz ve iyi bir cildin bakım ürünlerine bağlı olmadığını görebiliriz.
Amaçtan kaçamayız.

Hayatları boyunca sigara içen ve hiç hastalık yaşamadan uzun süre yaşayan insanlar var. Sağlıklı beslenmeyen, ancak yine de tamamen enerjik ve fit olan insanlar var; diğerleri ise daha sağlıklı beslenmelerine rağmen çok az enerjileri olabiliyor. Toplum bize her zaman, güzel paralar kazanabilmek için okumamız gerektiğini dayatır; mutlu bir aile kurabilmek için evli ve çocuklu olmamız gerektiğini dayatır; fit ve enerjik olabilmemiz için sağlıklı beslenmemiz gerektiğini söyler. Ancak etrafımıza baktığımızda, hiç çalışmadan veya okumadan finansal olarak tatmin edici bir yaşam süren insanları görüyoruz. Mutlu bir yaşam süren, çocukları olmayan insanları görüyoruz. Okuduğu halde işsiz veya finansal başarı elde edemeyen insanlar var, aynı şekilde aile kuran ama yinede mutsuz olan insanlar da var. Peki burada kural nedir? Dayanağımız nedir? Yoksa tamamen göz ardı edilen bir gerçek mi var? Evet! Amacımız.

İçinde bulunduğumuz durumun arkasında her zaman amacımızın yattığını anladığımızda, kendi gücümüzü elimize alabiliriz. Yukarıdaki örneklerden şu şekilde değiştirebiliriz: Sevdiğim insanla daha fazla zaman geçirmek için evlenmek istiyorum. Daha konforlu ve huzurlu bir ortamda yaşamak için daha iyi bir şehire taşınmak istiyorum. Daha sağlıklı ve formda olmak için spor yapmak istiyorum. Her şey niyetle gerçekleşir. İsteğin arkasındaki niyet. Her şey enerji boyutunda gerçekleştiği için, isteğimizin arkasında yatan amaç/niyet en önemli enerjidir. Bu nedenle, ne istediğimizi bilmek ve isteğimizin arkasındaki amacı anlamak önemlidir. Eğer amaç yokluk bilincinden geliyorsa, o zaman onu kolayca değiştirebiliriz. Aynı şey Enerji Çalışmaları için de geçerlidir.

Çoğu insan, negatif duygularla yüzleştiklerinde (direnç çözme) bu duygulardan daha fazlasını yaratacaklarından korkarlar. Ancak arkasında yatan amaç, bu duyguları deneyimlememiz ve sonra onlardan arınmamızdır. Yüksek benliğimiz, neyi hangi niyetle yaptığımızı bilir. Bir istek veya aynı şekilde enerji çalışmalarını yapma arzusu da, yüksek benliğimizden gelir. Yüksek benliğimiz bizden ayrı bir varlık değildir. Tabii ki, her enerji çalışmasında kendimize şu şekilde rahatlayabiliriz: "Bu çalışmadaki amacım, bu negatif duygulardan arınmak." Bu size güven verebilir, ancak aslında gerekli değildir, çünkü yüksek benliğimiz neyin hangi niyetle yapıldığını tam olarak bilir, bir şeyi manifestlemek amacıyla mı yoksa dirençlerimizden arınmak amacıyla mı yaptığımızı biliyor.

Bu nedenle, isteklerinizin arkasında yatan amacı / niyeti sorgulamak her zaman önemlidir. Eğer finansal özgürlük isteğimiz, daha fazla takdir görmek için ise, o zaman finansal olarak özgür olsak bile bu takdiri hiçbir zaman alamayız. "Sen sadece şanslıydın" gibi sözler veya "kirli işler yapılıyor" gibi şeyler duyabiliriz. Bu nedenle, isteğimizin arkasındaki niyeti her zaman bilmek önemlidir. Eğer bu amaç / niyet yokluk bilincinden geliyorsa, onu kolayca bolluk bilinciyle değiştirebiliriz.
"Herkesin niyet ettiği ne ise, eline geçecek olan odur." - Resûlullah (s.a.s.)
      '''),
    Article(
      'Sahip olmak-Yapmak-Olmak: İçsel İnsan ve Dışsal İnsan',
      'İçsel ve dışsal insan arasındaki ilişkiyi keşfedin.',
      '''Bize, birisi OLABİLMEK için önce bir şeye sahip olmamız veya bir şeyi elde etmemiz gerektiği, böylece uygun şekilde davranıp yapabileceğimiz öğretildi. Örneğin: Başarılı bir girişimci olmak için, para, bağlantılar gibi gerekli araçlara sahip olmamız (Sahip Olmak) ve sonra bu araçlara sahip olduğumuz için uygun şekilde hareket etmemiz (Bağımsızlık, başlangıç sermayesi, reklam vs.) ve böylece biri olabileceğimiz (başarılı bir girişimci) gerektiği düşünülür.

Sahip Olmak: Bir şeye sahip olmam gerek, örneğin: Bağlantılar, para, imkanlar.
Yapmak: İmkanlara sahip olduğum için hareket ederim.
Olmak: Şimdi belirli bir kişi oldum, örneğin finansal olarak başarılı biriyim.

Peki ya tam tersi olsaydı?

Enerjik açıdan, bunun tamamen tersine olması gerektiği açıktır. Eğer dış dünya, iç dünyamızın bir yansımasıysa, önce bir şeye sahip olmam gerektiği, sonra birisi olabileceğim nasıl mümkün olabilir? Bu, dışarıdan bir şey almanız gerektiği anlamına gelir, böylece dışarıda birisi olabilirsiniz. Enerjik açıdan, sadece varlık durumu vardır, bu durumdan her şey ortaya çıkar. Her şey içten dışa doğru tezahür eder, tersine değil. Bu nedenle, önce bir şeye sahip olmanız gerektiği, sonra birisi olabileceğiniz doğru olamaz.

Bu konuyla ilgili olarak "Simülasyon Dünyası" makalesini okuyabilirsiniz. Bu makalede, kolektif gerçeklik ve her şeyin nasıl birbirine bağlı olduğu anlatılmaktadır. Kolektif gerçekliğin nasıl yaratıldığı gibi, kendi gerçekliğimiz de yaratılır.

%95 bilinçsiz ve sadece %5 bilinçli karar veririz. Bu, her şeyin tezahür ettiği bir bilinç durumumuz olduğu anlamına gelir. Dil programları, sosyal etkileşimler, sportif olup olmamamız, çalışmayı sevip sevmediğimiz, utangaç olup olmadığımız, kendimizi küçük görüp görmediğimiz gibi birçok programımız var. Her duruma ilişkin kendi programlarımız var. Bu programlar, bilinç durumları olarak da adlandırılır ve bunların %5'ini bilinçli veya bilinçsiz olarak karar verdik.

Bu anlayış önemlidir çünkü birisi olmak için aslında hiçbir şey yapamayız. Eğer eylemin %95 bilinçsiz olduğunu anlarsak, sadece eylemlerle ilerleyemeyeceğimizi fark ederiz. Yapabileceğimiz tek şey, sahip olduğumuz %5 ile programlarımızı değiştirmek ve bilinçli kararlar almaktır.

Eylem sadece varlık durumunu takip eder. Yani, varlık durumu (içimizdeki programların toplamı) karar verir ve eylem otomatik olarak bunu takip eder.

Bu, başka bir soruyu gündeme getirir: Özgür irademiz var mı yok mu? Cevap çok net: Hayır. Özgür irade yok. Programın içinde özgür irademiz yok. Örneğin: Eğer "spor yapmayan bir kişi" programına sahipseniz, ne yaparsanız yapın, sportif bir insan olamazsınız. Kayıt olabilir ve kendinizi spor salonuna zorlayabilirsiniz, bu bir süre devam edebilir. Ancak bu sizin için bir işkence olacak ve er ya da geç pes edeceksiniz. Çünkü programa karşı savaşmanın bir anlamı yoktur. Beğenmediğiniz bir film gibi. Filmin içeriğini değiştiremezsiniz. Sadece filmi değiştirebilirsiniz. Her program, içerik olarak değiştirilemeyen bir frekanstır. Ancak frekansın kendisini değiştirebilirsiniz. Içeriğini değil.

Başka bir örnek: Sigara içen birisiniz ve sigarayı bırakmak istiyorsunuz. Eğer sigara içme programınızı, sigara içmeyen birine dönüştürmezseniz, dış dünyada başarılı olamazsınız. Er ya da geç tekrar başlayacak veya hayatınız boyunca mücadele edecek ve sizi tetikleyen durumlar ve insanlardan kaçınacaksınız. Programa karşı savaşmak zahmetli ve yararsızdır.

Programlarımızı en etkili şekilde nasıl değiştirebiliriz? Hayal gücümüzle, çünkü her şeyin mümkün olduğu yer burasıdır. Şu soruyu her zaman kendinize sorun: Dileğim yerine gelmiş ve bir ay geçmişse, ne olurdu? Önceki durumda, sigara içerdiniz ve sigarayı tekrar atardınız çünkü sigara içmeyen birisiniz. Tadı çok kötü gelir size. Dış dünyada hala sigara içebilirsiniz, ancak kısa süre içinde sigarayı beğenmeyeceksiniz ve otomatik olarak sigara içmeyen birine dönüşeceksiniz. Bu sadece programınızın değişmesi nedeniyle olur. Hiçbir mücadele, hiçbir zorlama yok.

Hepimiz iki insandan oluşuruz: Dışsal insan ve içsel insan.

Dışsal İnsan: %95
İçsel İnsan: %5

İçsel insan her zaman önde gider ve karar verir. Dışsal insan onu takip eder. Hayatımızda ne yaparsak yapalım, alışveriş yapmaktan işe gitmeye, yemek pişirmeye kadar her şeyi, bu durumu bile çok kısa bir süre için hayal ederiz. Bu, bilinçli veya bilinçsiz olarak gerçekleşir. Hayatımız boyunca bunu yaptığımız için, her eylemin daha önce hayalimizde sabitlendiğini fark etmeyiz. Fitnessa gitmeyi hayal etmezseniz eğer, fitnessa gidemezsiniz. Her şey önce hayalimizde kararlaştırılır. Bilinçli olarak dikkat ederseniz, bunu fark edeceksiniz. En küçük eylem bile önce hayalimizde kararlaştırılır. Hayal olmadan eylem olmaz.

Örneğin: Alışverişe gitmek istiyorsanız, hayalinizde kısada olsa alışverişe gitmeye karar verirsiniz. Ama sonra alışverişe gitmezseniz, bu hayalinizde alışverişe gitmemeye karar verdiğiniz anlamına gelir. Yani alışverişe gitsenizde veya vazgeçmiş de olsanız, her iki durumu önce hayalinizde karar almış olmalısınız.

İçsel insan (hayal) karar verir ve dışsal insan onu takip eder. Dışsal insanın karar verme özgürlüğü yoktur. Dışsal insan istediğini yapamaz. Şimdi sadece sokağa çıkıp bağırarak dışsal insanın kendi karar verdiğini kanıtlamak için bağırabilirsiniz. Bu elbette mümkündür. Ama sadece önce hayalinizde kararlaştırıldığı için mümkündür. Kısa da olsa hayal etmeden bir şeyin mümkün olup olmadığını deneyin.

Olmak için hiçbir şey yapamayız. Sadece "Olma"ya karar verebiliriz ve eylem (bilinçsiz %95) otomatik olarak takip eder. Olma halinizi hayal gücünüzle değiştirirseniz, eylem otomatik olarak takip eder. Aynı şeyi yapan, aynı ürünleri satan birçok insan var. Ama hepsinin farklı sonuçları var.

Ne yaptığınız önemli değil, önemli olan KİM olarak yaptığınızdır.

Dolayısıyla doğru sıra şu şekildedir:
OLMAK-YAPMAK-SAHİP OLMAK.
      '''),
    Article(
      'Mutluluk nedir?',
      'Mutluluk kavramı ve onu artırmanın yolları.',
      '''Mutluluk, kişiden kişiye ve yaşam deneyimlerine göre değişen bir kavramdır. Kimi insanlar hiçbir şeye sahip olmadıkları halde mutlu olabilirken, kimileri her şeye sahip olmalarına rağmen mutsuz olabilir. Kimi insanlar hiçbir şeye sahip olmadıklarında mutsuz olurken, kimileri her şeye sahip olduklarında mutlu olabilir. Burda anladığımız mutluluk icin genel bir formül yoktur. Mutluluk kavramı genellikle iç huzur, memnuniyet ve sevinç hissi olarak tanımlanır. Ancak, mutluluk kavramı kişiden kişiye farklılık gösterebilir ve herkesin mutluluk algısı kendine özgüdür.

Yapılmaması gerekenler:
Mutsuzluğumuza büyük bir katkısı olan birşey varsa o da sosyal medyadır. Sosyal medya kullanımınızı azaltın. Bir araştırmaya göre sosyal medya kullanıcılarının dopamin seviyesi, sürekli bir haketme durumu olmadan arttığı için, daha basit eylemlerle (kitap okuma, uzun film izleme, odaklanma) gibi sorunlar ortaya çıkabilir. Bu, doğal olmayan bir şekilde dopamin salgılayarak bunu "hak etmeden ulaştım" duygusuyla almamızdan kaynaklanıyor. Doğal dopamin kaynakları ise yürüyüşler, kitap okumalar, güneş ışığını hissetme, temiz hava gibi şeylerdir.

Dopamin seviyesi yükseldikçe, "doğal" olan dopamin bizlere artık yetmiyor ve küçük şeylerden mutlu olmayı unutuyoruz çünkü sanaldan aldığımız dopamin seviyesi çok daha yüksek ve bizler bunun için hiçbir çaba sarf etmek zorunda değiliz. Sosyal medya sürenizi azaltarak ve dolayısıyla dopamin seviyenizi düşürerek mutluluğunuza büyük bir katkıda bulunabilirsiniz.

Mutluluğumuza büyük katkısı olanlar arasında 3 şey vardir. 
1. Bir Gözlemci olarak yaşamak ( Yazılar Köşesinde: Gözlemci olarak yaşamak ) 
2. Anda yaşamak ( Şimdiki an Meditasyonu )
3. Dirençleri dönüştürmek ( Direnç çözme meditasyonu) 

Ilk iki bilinç durumu kolay ulaşılıcak bilinç durumları olmadıkları için bu durum herkese mümkün olmayabiliyor. Eğer hep gözlemci olarak veya anda yaşarayak kalabilseydik herzeman çok memnun ve mutlu olurduk. Geçmişe dönüp baktığınızda mutlu olduğunuz her an aslında anda oldugunuz andı. Üçüncüsü ise Dirençlerimiz. Dirençlerimizi meditasyonlarla kısa sürede dönüştürebiliriz. 

Bir deneyden bahsedelim: Bir grup insan arasında biri (22 kişi) büyük miktarda para kazanırken diğerleri (18 kişi) trafik kazası geçirirmiş insanlar. Bunlardan birçoğu kalıcı hasarla uğraşır. Para kazananların mutluluk seviyeleri kazançtan kısa süre sonra ölçülür. Aynı şekilde trafik kazası geçirenlerinde mutluluk seviyeleri kısa bir süre sonra ölçülür. Bir yıl sonra tekrar ölçüldüğünde, kazandıkları parayla mutlu olanlar ile kazada yaralananlar arasında mutluluk seviyeleri neredeyse aynıdır. Bizler insan olarak yeni bulunduğumuz duruma çok çabuk alışıyor ve ayak uyduruyoruz. Bir süre sonra yeni olan her şey bizim normalimiz oluyor. Otobanda bir süre 200/km gidersek artık o kadar hızlı gittiğimizi farketmeyiz. Tek farkettiğimiz artıştır. Dolayısıyla durumumuz ne olursa olsun mutluluğumuza pek bir katkısı yoktur. Konforumuz, imkanlarımız, rahatımız olabilir ama mutluluğumuza değil. Özellikle istediği her şeye ulaşmış olan insanların durumu bazen daha zor olabiliyor. "Her şeye ulaştım, aslında mutlu olmam lazım" mutsuzluğu olabiliyor.
"Eğer bir fincan kahve ile mutlu olamıyorsan, bir yat ile de mutlu olamazsın."

Peki, madem durumumuz ne olursa olsun mutluluğumuza pek bir katkısı olmadığını gördük, gerçekten ne yapabiliriz? Her insanın bir temel modu vardır. Gün sonunda geri döndüğü bir temel mod. Bu modu yükselterek mutluluğumuza büyük bir katkı sağlayabiliriz. Olay aslında temel modumuzu yükseltmekden geciyor. Bunun için birkaç ipucu:

Size iyi gelebilecek ve günlük veya haftalık rutinlerinize dahil edebileceğiniz bazı etkinlikler:

Dans, müzik dinleme,
Spor, yoga, hareket vs.
Şükran günlüğü yazın
Kahve veya çay için sevinin
Doğada ve hayvanlarla biraz zaman geçirin,
Sosyalleşin, Insanlarla sanal veya gerçek hayatta birleşin 
Kendinize bir çevre yapın
Ibadet etmek, ruhsallık, ritüeller 
Hayatınızda bir Amaç belirleyin

Bunlar, genel modunuzu yükselterek daha uzun vadede mutluluk oranınızı artırmanıza yardımcı olacaktır. Üstelik bedava olan şeyler.
      '''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yazılar Köşesi')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            title: Text(article.title),
            subtitle: Text(article.subtitle),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to article detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ArticleDetailScreen sınıfını oluştur
class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.content),
      ),
    );
  }
}
