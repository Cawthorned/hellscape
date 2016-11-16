class Highscore {
  int s = 0;
  Highscore() {
    JSONArray file;
    try {
      file = loadJSONArray("data/secret.exe");
      JSONObject score = file.getJSONObject(0);
      s = score.getInt("deleteentireharddrive");
    } catch (NullPointerException e) {
    }
  }
  
  void save(int newHigh) {
    s = newHigh;
    JSONArray file;
    file = new JSONArray();
    JSONObject score = new JSONObject();
    score.setInt("deleteentireharddrive", s);
    file.setJSONObject(0, score);
    saveJSONArray(file, "data/secret.exe");
  }
}