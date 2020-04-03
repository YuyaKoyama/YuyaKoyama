package websample13_14;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ログイン機能.
 */
@WebServlet("/LoginServletShopping")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	/**
	 * コンストラクタ.
	 */
    public LoginServlet() {
        super();
    }

    /**
     * POSTメソッドでリクエストされた場合の処理.
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// ログイン画面または、ヘッダー画面からの値を判定
		String btn = request.getParameter("submit");
		
		// 画面移動の準備
		HttpSession session = request.getSession();	// セッション
		RequestDispatcher rd;						// 画面の情報
		
		if("ログイン".equals(btn)) {
			
			// クリックされたボタンが「login」の場合はログイン処理を実施
			// ログイン画面で入力されたIDとパスワードを取得
			String id  = request.getParameter("id");
			String pass= request.getParameter("pass");
			
			// ユーザ情報をモデルに格納するために指示
			// ログイン処理クラスをインスタンス化
			LoginDB login = new LoginDB();
			
			// ID処理クラスに②-1-1で取得したIDを渡してユーザ情報をモデルに格納
			LoginUserBean bean = login.getUserData(id, pass);
			
			// モデルの情報を判定
			if(bean != null) {
				
				// モデルの情報が存在する場合はsetAttributeメソッドを使ってセッションに情報をセット
				// モデル（ユーザ情報）
				session.setAttribute("user_db", bean);
				// ログイン状態
				session.setAttribute("login_db", "login_db");
				// つぎに表示させる画面（ビュー）を指定
				rd = request.getRequestDispatcher("./ShoppingServlet");
				
			} else {
				
				// モデルの情報が存在しない（IDに紐づくユーザ情報がない）場合
				// つぎに表示させる画面（ビュー）を指定
				rd = request.getRequestDispatcher("./WEB-sample13_14/loginNG.jsp");
			}
			
			rd.forward(request, response);
			
		} else if("logout".equals(btn)) {
			
			// クリックされたボタンが「logout」の場合はログアウト処理（セッションの破棄）を実施
			session.removeAttribute("login_db");
			session.removeAttribute("user_db");
			response.sendRedirect("./WEB-sample13_14/login.jsp");
			
		} else if("history".equals(btn)) {
			
			// セッションからユーザIDを取得して購入履歴を検索
			// クリックされたボタン（リンク）が「履歴」の場合は購入履歴画面に移動
			Shopping shopping = new Shopping();
			
			// セッションからユーザIDを取得
			String id = ((LoginUserBean)session.getAttribute("user_db")).getId();
			
			// 購入履歴を取得
			ArrayList<HistoryBean> bean = shopping.getHistory(id);
			
			// リクエストスコープにセットして画面移動
			request.setAttribute("history", bean);
			rd = request.getRequestDispatcher("./WEB-sample13_14/history.jsp");
			rd.forward(request, response);
		}
	}
	
	/**
	 * GETメソッドでリクエストされた場合の処理.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 今回はdoPostで処理
		doPost(request, response);
	}
}