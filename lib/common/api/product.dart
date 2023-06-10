import '../index.dart';

/// 商品 api
class ProductApi {
  /// 分类列表
  static Future<List<CategoryModel>> categories() async {
    var res = await ApiOrginService.to.get(
      '/products/categories',
    );

    List<CategoryModel> categories = [];
    for (var item in res.data) {
      categories.add(CategoryModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return categories;
  }

  /// 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await ApiOrginService.to.get(
      '/products',
      params: req?.toJson(),
    );

    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  /// 商品详情
  static Future<ProductModel> productDetail(int? id) async {
    var res = await ApiOrginService.to.get(
      '/products/$id',
    );
    return ProductModel.fromJson(res.data);
  }

  /// 属性列表
  /// id 1 颜色 2 尺寸
  static Future<List<AttributeModel>> attributes(int id) async {
    var res = await ApiOrginService.to.get(
      '/products/attributes/$id/terms',
    );

    List<AttributeModel> attributes = [];
    for (var item in res.data) {
      attributes.add(AttributeModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    attributes.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return attributes;
  }

  /// 评论列表
  static Future<List<ReviewModel>> reviews(ReviewsReq? req) async {
    var res = await ApiOrginService.to.get(
      '/products/reviews',
      params: req?.toJson(),
    );

    res.data = [
      {
        "id": 12,
        "date_created": "2022-04-04T23:36:23",
        "date_created_gmt": "2022-04-04T15:36:23",
        "product_id": 13,
        "status": "approved",
        "reviewer": "ducafecat5",
        "reviewer_email": "ducafecat5@gmail.com",
        "review": "<p>001 - Nice album!</p>\n",
        "rating": 5,
        "verified": false,
        "reviewer_avatar_urls": {
          "24":
              "https://secure.gravatar.com/avatar/8b3a29ec6f524eed54bbf360e545fef8?s=24&d=mm&r=g",
          "48":
              "https://secure.gravatar.com/avatar/8b3a29ec6f524eed54bbf360e545fef8?s=48&d=mm&r=g",
          "96":
              "https://secure.gravatar.com/avatar/8b3a29ec6f524eed54bbf360e545fef8?s=96&d=mm&r=g"
        },
        "_links": {
          "self": [
            {
              "href":
                  "https://wp.ducafecat.tech/wp-json/wc/v3/products/reviews/12"
            }
          ],
          "collection": [
            {"href": "https://wp.ducafecat.tech/wp-json/wc/v3/products/reviews"}
          ],
          "up": [
            {"href": "https://wp.ducafecat.tech/wp-json/wc/v3/products/13"}
          ]
        }
      }
    ];

    List<ReviewModel> reviews = [];
    for (var item in res.data) {
      reviews.add(ReviewModel.fromJson(item));
    }
    return reviews;
  }

  /// tags 列表
  static Future<List<TagModel>> tags(TagsReq? req) async {
    var res = await ApiOrginService.to.get(
      '/products/tags',
      params: req?.toJson(),
    );

    List<TagModel> tags = [];
    for (var item in res.data) {
      tags.add(TagModel.fromJson(item));
    }
    return tags;
  }
}
