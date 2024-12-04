package uz.pdp.dbpractise.Homewrok;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportData {
    private String courseName;
    private Long studentCount;
    private Integer paymentAmount;


}
