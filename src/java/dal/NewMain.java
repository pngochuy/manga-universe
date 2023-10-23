/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dal;

import java.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;
import model.Manga;
import model.Post;
import model.User;
import ultils.EncryptPassword;

/**
 *
 * @author PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        LocalDateTime dateCreated = LocalDateTime.now();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();
        MangaDAO mangaDAO = new MangaDAO();
        EncryptPassword encryptPassword = new EncryptPassword();

//        userDAO.create(new User("image/3.png", "fpt", "123", "", "sieunhangao@gmail.com", "", 
//                false, "Author", dateCreated, 9999, dateCreated));
        User user = new User(2, "", "premium", encryptPassword.toSHA1("123"), "", "premium123@gmail.com", "", true, "Premium", dateCreated, 0, dateCreated);
//        userDAO.create(user);
//        int userId = userDAO.getUserId("author", "123", "author123@gmail.com");
//        userDAO.update(user);
//        userDAO.delete(12);
        Post post = new Post(4, "https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog-detail/blog-img-1.jpg",
                "Dragon Ball’s 948th Episod", "Ðây là descrition nha các bạn",
                dateCreated);

//        postDAO.create(post);
//        System.out.println(postDAO.create(post));
//        int postId = postDAO.getPostID(4, "One piêc");
//        System.out.println(postId);
//        postDAO.create(post);
//        System.out.println(postDAO.getAll());
//        for (Post p : postDAO.getNextThreePost(3)) {
//            System.out.println(p);
//        }
        Manga manga = new Manga("Boku No Hero Academia", "Vào tương lai, lúc mà con người với những sức mạnh siêu nhiên là điều thường thấy quanh thế giới. Đây là câu chuyện về Izuku Midoriya, từ một kẻ bất tài trở thành một siêu anh hùng. Tất cả ta cần là mơ ước.",
                4, dateCreated, true, true, "http://res.cloudinary.com/djytvqlon/image/upload/v1696507608/t6plxvqducox94cokk90.jpg");
        System.out.println(mangaDAO.create(manga));
                
    }

}
