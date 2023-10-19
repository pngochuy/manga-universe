
package dal;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import model.Manga;

/**
 *
 * @author Admin
 */
public interface mangaInterface {
    List<Manga> getAllMangas();
    void addManga( String title, String description,int userID, 
            Date createAt, boolean isCopyRight,boolean isFree,String coverImage);
    void updateManga(String title, String description,int userID, 
            Date createAt, boolean isCopyRight,boolean isFree,String coverImage, int id);
    void deleteManga(Integer id);
//    Manga findManga(Predicate<Manga> p);
}
