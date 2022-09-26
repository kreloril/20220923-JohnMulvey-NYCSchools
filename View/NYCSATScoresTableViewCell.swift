//
//  NYCSATScoresTableViewCell.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/25/22.
//

import UIKit

class NYCSATScoresTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMathScore: UILabel!
    @IBOutlet weak var labelReadingScore: UILabel!
    @IBOutlet weak var labelWritingScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
