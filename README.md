## 1\. Value proposition

The value proposition of our application is multifaceted and focuses on addressing several important aspects for users:

1. **Dynamic discounts based on proximity to expiration date:** Our application offers discounts on food items that are nearing their expiration date, meaning users can obtain lower prices as the expiration date approaches. This strategy not only benefits consumers by providing significant savings but also helps reduce food waste by giving items a second chance before they become unsellable.
2. **Variety of products and purchasing options:** As a marketplace, our application allows users to access a wide range of products from different stores, providing them with diverse options to meet their dietary needs. Additionally, we offer the convenience of purchasing either in-store or through home delivery, catering to the individual preferences and circumstances of each user.
3. **Ease of use and customer service:** Our application prioritizes the user experience by offering features such as recipe suggestions based on the ingredients in their shopping cart and a dedicated text channel for complaints and suggestions.
4. **Instant discounts and transparency:** Unlike other applications that require users to scan their receipts to receive refunds, our system offers instant discounts at the time of purchase. This streamlines the process and eliminates the need for additional user procedures, providing a smoother and more convenient shopping experience.
5. **Personalization and intelligent notifications:** We utilize data from users' preferences and past purchases to send them notifications about discounted products that may interest them, allowing them to make the most of available offers. This personalization improves the relevance of the application for each user and increases the likelihood of them finding products they truly want to purchase.
6. **Transparency and awareness of food waste:** Our application allows users to view visual analyses of the impact they are having on reducing food waste. This enables them to better understand how their purchasing choices contribute to a broader sustainability goal, motivating them to continue using the application for beneficial purposes for both themselves and the environment.
7. **Unprepared products:** Unlike other applications that focus on selling already prepared products, we stand out by offering discounts on unprepared foods that are nearing their expiration date, allowing users to have greater control over how they will use these products to their benefit.

**Smart features** (features 1, 4, 5, and 6) generate value in several ways:

* **Increased sales and customer acquisition:** Dynamic discounts (1) incentivize purchases, while instant discounts (4) and personalized recommendations (5) create a more attractive user experience, leading to higher customer acquisition and retention.
* **Reduced operational costs:** By facilitating sales of near-expiry items (1) and promoting efficient purchase processes (4), we potentially reduce spoilage and the need for manual price adjustments.
* **Improved brand image:** Transparency about food waste reduction (6) fosters a positive brand image, attracting environmentally conscious customers.

**CAS features** (features 2, 3, and 7) add value through:

* **Enhanced user experience:** Offering a variety of products and purchasing options (2) caters to diverse customer needs. Features like recipe suggestions (3) and focusing on unprepared items (7) further personalize the user experience, increasing satisfaction and loyalty.
* **Data-driven decision making:** By analyzing user behavior and preferences through CAS (2, 3, 5, 7), we can gain valuable insights to optimize product selection, promotions, and marketing strategies, leading to better resource allocation and potentially higher profits.
* **Competitive advantage:** The unique combination of features, particularly the focus on unprepared food nearing expiry (7), sets our application apart, attracting a specific customer segment and creating a competitive edge.

## 2\. UI/UX

**I. Colour palette and its rationale**

First, regarding color psychology, green tone is used as it evokes freshness, vitality, and nature, which can convey the idea that the products are fresh and in good condition despite their proximity to the expiration date. Similarly, white is a color that suggests purity, cleanliness, and clarity, so using it in the color palette conveys the idea of transparency and assurance to users that the products are in good condition and safe to consume.

Moreover, the combination of green, gray, black, and white tones provides a strong visual contrast between the different elements of the application. This helps users quickly identify available products and focus on relevant information. It also facilitates readability and navigation as contrast between text and background is crucial for ensuring good readability. By using dark tones such as gray or black for text on a light background like white, readability is improved, and user navigation through the application is facilitated. Additionally, contrast between colors helps buttons and calls to action stand out more prominently and be easier to identify.

![colors.png](uploads/1cec9a05eff6278a76f067ec949f33ac/colors.png)**II. Fonts**

We use the Inter font because it is designed for both computer and mobile screens. This font has multilingual support, which can be useful in case internationalization is required. It is noteworthy that it has a wide range of weights ranging from delicate 100 to heavy 900, allowing adaptation to design needs. Additionally, this font has been designed with details that enhance readability, as well as contextual alternatives that adjust punctuation depending on the shape of surrounding glyphs, tabular numbers, and slashed zero to avoid confusion between "0" and "o".

**III. Icons**

Material Design icons were chosen in order to achieve a unified design across the application. Additionally, a large number of icons are available, allowing for appropriate use to indicate actions to the user. Material Design icons are designed to be scalable and adaptable to different screen sizes and resolutions, ensuring they look good and remain legible on a variety of devices. Finally, as the application is for Android, these icons are utilized to leverage a design system in constant evolution, with regular updates and continuous support from Google.

![image.png](uploads/03e10ee6aefcead785d8bfce13b90857/image.png)

**IV. Images and illustrations**

We will use supermarket logos:

![image](uploads/228ce91e23fa8c8d0ea8c58f9969f389/image.png){width="489" height="164"}

We will use use products images:

![image.png](uploads/8c0b92927d96b8aada4aa92c9501580a/image.png){width="416" height="383"}

We will use recipies pictures:

![image.png](uploads/b2d4f8374adfad3677194889f52f944c/image.png)

**V. UI prototype**

For the UI prototype, the Figma tool was used. As of Friday, March 8, 2024, 14 views have been created, divided as follows:

**_Figma prototype:_** https://www.figma.com/file/ZevQ8CV7iPX2PWNZDFlBR9/FoodLoop?type=design&node-id=0%3A1&mode=design&t=Hb03Uf5Gqd8H3xxP-1

**_Short video (3:50):_** https://youtu.be/H4Xgb7GdPOM

_The purpose of the video is to quickly show all the views in a general way. For more details, they are below with the name of the view and a description._

* **Slash:** Initial app screen with the logo and the new app name.

  ![image.png](uploads/c6a9412ca8145ff8cb2df3c838ea497b/image.png)
* **Welcome:** Home page where users can register or log in if they already have an account.

  ![image.png](uploads/603322d430114fb8a8b9562e68cf0471/image.png)
* **Registration page:** View with the registration form.

  ![image.png](uploads/8fd80aed86841338d769929e9bcaf569/image.png)
* **Login page:** View with the login form.

  ![image.png](uploads/0144a37cea5e3e20d9c3b4f86547b1a3/image.png)
* **Home:** Main view of the application where you can find the allied supermarkets, the products close to being sold, and the recommendations given by the smart feature.

  **Home 2:** Continuation of the previous view where you can also see a list of products.

  ![image.png](uploads/0b929f01119658de865c770822ca6853/image.png)
* **SideMenu:** View where you can see the options and features that the application provides.

  ![image.png](uploads/64d6b3b97a5cdccda77edd43adc8ef9d/image.png)
* **Search:** When you click on search, items that are similar to the searched word will appear.

  **Search 2:** When you select the desired product, the supermarkets that have the product will appear.

  ![image.png](uploads/655ccbe442e7b7b0235629f90a1ebcde/image.png)
* **Recommendations:** View that shows the recommended products based on the purchases that the user has made.

  ![image.png](uploads/56ff4d18339bb82696d86b2894c84525/image.png)
* **Recipes:** The recipes page shows the products that the user has purchased.

  ![image.png](uploads/c03ddd8e77f7b6efec8cbd5833393c4e/image.png)

  **Recipes list:** View that shows the possible recipes that can be made with the products.

  ![image.png](uploads/b5d29b44841298b37f696bde357c2b5c/image.png)

  **Recipes detail:** View that shows the description of the recipes and their products.

  ![image.png](uploads/85824b48b6493162fe3928738747b533/image.png)

  **Recipes detail 2:** View that shows step by step how to prepare it.

  ![image.png](uploads/a580567a9038032c6669c2428894cbc3/image.png)
* **Product:** View that shows the product name, its description, the original price, the discounted price and the expiration date.

  ![image.png](uploads/ec2ef9e6b24165a121fc63ce80c6d258/image.png)
* **Shopping cart:** View that shows the products that the user wants to buy, the shopping cart can be modified if the user changes their mind.

  ![image.png](uploads/7952357ef2285bab201b0abf09967bb1/image.png)
* **Order summary:** Shows the delivery details such as the payment method, the cost with the necessary information and its confirmation.

  ![image.png](uploads/929bfa21b6905e8fa13b1c52c575e665/image.png)
* **Favorites:** List of products that the user has selected as their favorites.

  ![image.png](uploads/1aea4056e18cb7941a530cff488fd8a6/image.png)
* **Maps of delivery:** Shows on a map the estimated delivery time from the supermarket to the selected address.

  ![image.png](uploads/fbb8622a2a3c4507cf78e35f737bbc4b/image.png)
* **Saving:** Initially shows the total amount of money saved in a specific month, in this case March, the accumulated total, and a bar graph showing the history of all previous months.

  ![image.png](uploads/68eb8ff7cbfa5cf8d8e30d5a93af3d0c/image.png)

**VI. Navigational patterns**

We decided to use the navigation pattern known as the Hamburger menu because it allows us to hide navigation options and secondary functions, helping to conserve space in the user interface and maintain a clean and organized design. By hiding the navigation options behind the Hamburger menu, the user's attention can be focused on the main content of the application. This can improve the user experience by reducing distractions and facilitating concentration on the main task the user wants to perform. Similarly, this pattern provides ease of access to the user because although the navigation options are hidden behind the Hamburger menu, their access remains easy and fast for users. The Hamburger menu is an established and widely used design pattern in mobile applications. Its use provides coherence with design standards and the user experience, making the application more intuitive and easy to use for users familiar with this pattern.

The Stepper pattern was also used as it provides a step-by-step process for users. In this case, for example, making a purchase, searching for a product, or buying it require several steps that the user must follow, and from which they can return. Additionally, it facilitates user navigation within a process, allowing them to systematically progress through each step without getting lost or feeling overwhelmed by the amount of information presented all at once. This provides a structured and easy-to-follow user experience.
