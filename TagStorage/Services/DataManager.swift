//
//  DataManager.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 29.09.2021.
//

class DataManager {
    static let shared = DataManager()
    
    let settingsMenu = ["Help&Support", "What's New", "About This App"]
    let settingsImages = ["questionmark.circle", "text.book.closed", "info.circle"]
    
    
    let advicePreviewImages = [
        "one",
        "two",
        "three",
        "two",
        "two",
        "two",
        "two",
        "two",
        "two",
        "two",
    ]
    let adviceMainLabelTexts = [
        "Select the Right Water Temperature",
        "Select the Right Detergent",
        "Use Less Detergent",
        "Catch Stains Quickly",
        "Avoid Bleeding Colors",
        "Reduce Fading",
        "Avoid Shrinking and Stretching",
        "Keep Whites Looking Bright",
        "Handle Delicates With Care",
        "Reduce Wrinkles"
    ]
    
    let adviceDetailLabelTexts = [
        "Selecting the right water temperature for each specific laundry load is the key to success. Cold water works well for delicate fabrics, items that might shrink, and sensitive dark colors that tend to bleed. Cold water also saves you money by reducing the cost of utilities. Warm water is appropriate for moderately soiled clothing and human-made fabrics. Hot water should be used for bedding and towels, cotton whites, and heavily stained work clothes, specifically those with oil or grease stains.",
        "When it's time to choose a detergent, shoppers often buy the one their parents used or grab the one that's cheapest. There are much better ways to select a detergent to meet your laundry needs. Powdered detergents work well for general loads and are usually less expensive; however, they don't always dissolve correctly in cold water and leave white residue on fabrics. Liquid detergents, which usually contain enzymes, are good for pretreating stains. The key to selecting a liquid detergent that fits your needs is to read a full list of ingredients. More enzymes in the formula equal better cleaning power. What about the single dose pods, packs, and tablets? They are convenient and easy to use. They prevent overdosing but check the price per load if you're on a budget. You can also make your own laundry products using one of several formulas.",
        "One of the biggest laundry mistakes is using too much detergent. Overdosing detergent can create so many suds that they trap soil allowing it to redeposit on clothes. Try using one-half less than the recommended amount and see if you are pleased with the results. Your clothes will look better and you'll save money. If you have a front load washer that smells terrible, using less detergent may just solve your problem.",
        "The key to successful stain removal is to act quickly. As soon as possible after stains occur, rinse or soak the garment in cold water, apply a stain remover, and get it into the washer. If the stain is still there, never put the garment in the dryer. Use a stain remover and rewash. Be sure to use the right stain removal technique for each type of stain.",
        "No one wants the surprise of pink underwear or a tie-dyed effect on a white shirt. In other words, always sort your clothes correctly to prevent colors from bleeding onto unsuspecting fabrics. To find out if something is colorfast before you wash it, wet a cotton swab and rub it on an inside corner or seam and see if the dye transfers to the swab. If it does, hand wash the item separately. If that random red sock falls into a white load of clothes, know how to remove the dye stains.",
        "Clothes are expensive and fading can cause them to look worn out very quickly. By turning dark-colored clothes inside out before washing you can avoid abrasion and wear to fabric surfaced that cause dull appearances. Know how to keep black clothes black to protect your clothing investment.",
        "The reasons clothes shrink and stretch are varied from fiber content and type of weave to how you wash or clean them. Some of the best ways to avoid shrinking or stretching in clothing are to use a cold water setting, avoid too much agitation, and a hot clothes dryer.",
        "When whites start going gray or yellow, it could be because you are using water temperatures that are too low. You may be overloading your washer and piling in really dirty clothes that cause dirt to resettle on mildly soiled clothes making them dull.",
        "To make bras and delicate undergarments hold their shape and last longer, wash them by hand in a sink filled with cool water. If you want to use the washer, toss bras in a mesh lingerie bag and use the delicate cycle.",
        "Who has time to iron? Use a fabric softener or dryer sheet to help reduce fabric wrinkles and select the lowest dryer temperature setting possible that will still get the job done. Always remove clothing from the dryer as quickly as possible when they're dry and immediately fold or hang them."
    ]
    
    private init() {}
}
