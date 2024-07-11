public class NewsWrapper {

	public String status;
	public List<Sources> sources;

	public class Sources {
		public String id;
		public String name;
		public String description;
		public String url;
		public String category;
		public String language;
		public String country;
	}

	
	public static NewsWrapper parse(String json) {
		return (NewsWrapper) System.JSON.deserialize(json, NewsWrapper.class);
	}
}