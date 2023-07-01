package image;

import java.util.List;

public class ImageListService{
	public List<ImageVO> service() throws Exception{
		ImageDAO dao = new ImageDAO();
		return dao.list();
	}
	
}
