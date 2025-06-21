package lk.ijse.project.model;

public class Complaint {
    private int id;
    private String title;
    private String description;
    private int userId;
    private String status;
    private String solution;

    public Complaint(int id, String title, String description, int userId, String status, String solution) {

        this.id = id;
        this.title = title;
        this.description = description;
        this.userId = userId;
        this.status = status;
        this.solution = solution;

    }

    public Complaint(String title, String description, int userId) {

        this.title = title;
        this.description = description;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public String getDescription() {
        return description;
    }
    public int getUserId() {

        return userId;
    }
    public String getStatus() {
        return status;
    }
    public String getSolution() {
        return solution;
    }
    public void setSolution(String solution) {
        this.solution = solution;
    }
}
