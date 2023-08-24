//
//  DetailCells.swift
//  20230822-TulasiVuppugalla-NYCSchools
//
//  Created by Tulasi on 8/23/23.
//

import Foundation
import UIKit

class DetailCells{
    
    static func tableViewCellWithSATScore(_ tableView: UITableView, HSWithSatScore: NYCHighSchools) -> UITableViewCell{
           let schoolWithSATScoresCell = tableView.dequeueReusableCell(withIdentifier: DetailConstants.Cells.schoolWithSATScoreCellIdentifier) as! HSSatScoresTableViewCell
           
           schoolWithSATScoresCell.hsNameLbl.text = HSWithSatScore.schoolName
           
           schoolWithSATScoresCell.satReadingAvgScoreLbl.text = (HSWithSatScore.satCriticalReadingAvgScore != nil) ?  (DetailConstants.averageSATReadingScore + HSWithSatScore.satCriticalReadingAvgScore!) : DetailConstants.noSATScoreInfomationText
           
           schoolWithSATScoresCell.satMathAvgScoreLbl.isHidden = (HSWithSatScore.satMathAvgScore != nil) ? false : true
           schoolWithSATScoresCell.satMathAvgScoreLbl.text = (HSWithSatScore.satMathAvgScore != nil) ? (DetailConstants.averageSATMathScore + HSWithSatScore.satMathAvgScore!) : nil
           
           // Sets the Writing Average Score
           schoolWithSATScoresCell.satWritingAvgScoreLbl.isHidden =  (HSWithSatScore.satWritinAvgScore != nil) ? false : true
           schoolWithSATScoresCell.satWritingAvgScoreLbl.text = (HSWithSatScore.satWritinAvgScore != nil) ? (DetailConstants.averageSATWritingScore + HSWithSatScore.satWritinAvgScore!) : nil
           
           return schoolWithSATScoresCell
       }

static func tableViewCellWithOverView(_ tableView: UITableView, HSWithSatScore: NYCHighSchools) -> UITableViewCell{
       let schoolWithOverviewCell = tableView.dequeueReusableCell(withIdentifier: DetailConstants.Cells.schoolOverviewCellIdentifier) as! HSOverviewTableViewCell
       
       schoolWithOverviewCell.hsOverviewLbl.text = HSWithSatScore.overviewParagraph
       
       return schoolWithOverviewCell
   }

static func tableViewCellWithContactInfo(_ tableView: UITableView, HSWithSatScore: NYCHighSchools) -> UITableViewCell{
       let schoolWithContactCell = tableView.dequeueReusableCell(withIdentifier: DetailConstants.Cells.schoolWithContactCellIdentifier) as! HSContactTableViewCell
       
       schoolWithContactCell.hsAddressLbl.text = "Address: " + Utils.getCompleteAddressWithoutCoordinate(HSWithSatScore.schoolAddress)
       schoolWithContactCell.hsPhoneLbl.text = (HSWithSatScore.schoolTelephoneNumber != nil) ? "Tel:  " + HSWithSatScore.schoolTelephoneNumber! : ""
       schoolWithContactCell.hsWebsiteLbl.text = HSWithSatScore.schoolWebsite
       
       return schoolWithContactCell
   }

static func tableViewCellWithAddress(_ tableView: UITableView, HSWithSatScore: NYCHighSchools) -> UITableViewCell{
      let schoolWithAddressCell = tableView.dequeueReusableCell(withIdentifier: DetailConstants.Cells.schoolWithAddressCellIdentifier) as! HSAddressTableViewCell
      
      if let highSchoolCoordinate = Utils.getCoodinateForSelectedHighSchool(HSWithSatScore.schoolAddress){
          schoolWithAddressCell.addHSAnnotaionWithCoordinates(highSchoolCoordinate)
      }
      
      return schoolWithAddressCell
  }
}
